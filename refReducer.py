import re
import argparse

def limit_authors(input_file, output_file):
    with open(input_file, 'r') as f:
        bibtex = f.read()

    # Regular expression to match author fields with different delimiters and handle case insensitivity
    author_pattern = re.compile(
        r'(\bauthor\s*=\s*([{"]))(.*?)(\2)',
        re.IGNORECASE | re.DOTALL
    )

    def process_author(match):
        prefix = match.group(1)
        delimiter = match.group(2)
        authors_str = match.group(3)
        closing = match.group(4)

        # Split authors using case-insensitive 'and' with surrounding whitespace
        authors = re.split(r'(?i)\s+and\s+', authors_str.strip())
        authors = [a.strip() for a in authors if a.strip()]

        if len(authors) > 2:
            new_authors = authors[:2] + ['others']
            new_authors_str = ' and '.join(new_authors)
        else:
            new_authors_str = authors_str  # Preserve original if two or fewer authors

        return f'{prefix}{new_authors_str}{closing}'

    # Substitute all author fields using the processing function
    modified_bibtex = author_pattern.sub(process_author, bibtex)

    with open(output_file, 'w') as f:
        f.write(modified_bibtex)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Limit authors in BibTeX entries to two authors followed by "et al."')
    parser.add_argument('input', help='Input BibTeX file')
    parser.add_argument('output', help='Output BibTeX file')
    args = parser.parse_args()

    limit_authors(args.input, args.output)
