#!/usr/bin/env python3
"""
Normalize person_details.csv by splitting relevant_location into city and country_id.

Creates:
- countries.csv: lookup table (country_id, country_name)
- person_details_normalized.csv: with city and country_id instead of relevant_location
"""

import csv
import re
from pathlib import Path
from typing import Dict


def extract_countries(csv_path: Path) -> Dict[str, int]:
    """Extract all unique countries from relevant_location column."""
    countries = {}
    country_id = 1
    
    with open(csv_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            location = row['relevant_location'].strip('"')
            # Extract country (after the last comma)
            parts = location.rsplit(',', 1)
            if len(parts) == 2:
                country = parts[1].strip()
                if country not in countries:
                    countries[country] = country_id
                    country_id += 1
    
    return countries


def normalize_person_details(
    input_path: Path,
    output_dir: Path,
    countries: Dict[str, int]
) -> None:
    """
    Split relevant_location into city and country_id.
    
    Outputs:
    - countries.csv: lookup table
    - person_details_normalized.csv: with city and country_id columns
    """
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Write countries lookup table
    countries_sorted = sorted(countries.items(), key=lambda x: x[1])
    with open(output_dir / 'countries.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['country_id', 'country_name'])
        for country, country_id in countries_sorted:
            writer.writerow([country_id, country])
    
    # Write normalized person_details
    with open(input_path, 'r', encoding='utf-8') as infile, \
         open(output_dir / 'person_details_normalized.csv', 'w', newline='', encoding='utf-8') as outfile:
        
        reader = csv.DictReader(infile)
        fieldnames = [
            'person_mal_id', 'url', 'website_url', 'image_url', 'name',
            'given_name', 'family_name', 'birthday', 'favorites', 'city', 'country_id'
        ]
        writer = csv.DictWriter(outfile, fieldnames=fieldnames)
        writer.writeheader()
        
        for row in reader:
            location = row['relevant_location'].strip('"')
            # Split by last comma to separate city and country
            parts = location.rsplit(',', 1)
            
            if len(parts) == 2:
                city = parts[0].strip()
                country = parts[1].strip()
                country_id = countries[country]
            else:
                # Fallback (shouldn't happen based on our analysis)
                city = location
                country_id = ''
            
            new_row = {
                'person_mal_id': row['person_mal_id'],
                'url': row['url'],
                'website_url': row['website_url'],
                'image_url': row['image_url'],
                'name': row['name'],
                'given_name': row['given_name'],
                'family_name': row['family_name'],
                'birthday': row['birthday'],
                'favorites': row['favorites'],
                'city': city,
                'country_id': country_id
            }
            writer.writerow(new_row)


def main():
    """Main entry point."""
    csv_path = Path('datasets/person_details.csv')
    output_dir = Path('output/normalized')
    
    if not csv_path.exists():
        print(f"Error: {csv_path} not found")
        return
    
    print(f"Reading {csv_path}...")
    countries = extract_countries(csv_path)
    
    print(f"Found {len(countries)} unique countries:")
    for country, country_id in sorted(countries.items(), key=lambda x: x[1]):
        print(f"  {country_id}: {country}")
    
    print(f"\nNormalizing data...")
    normalize_person_details(csv_path, output_dir, countries)
    
    print(f"\nOutput files created in {output_dir}/:")
    print(f"  - countries.csv")
    print(f"  - person_details_normalized.csv")


if __name__ == '__main__':
    main()
