#!/bin/bash

# Directories
SRC_DIR="src"
OUTPUT_DIR="output"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Change to the source directory
cd "$SRC_DIR" || exit 1

# Loop through all .md files in the source directory
for INPUT_FILE in *.md; do
    # Extract filename without extension
    FILE_NAME="${INPUT_FILE%.md}"
    OUTPUT_FILE="../$OUTPUT_DIR/${FILE_NAME}.pdf"

    # Generate PDF using Pandoc & XeLaTeX
    echo "Generating PDF for $INPUT_FILE..."
    pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --pdf-engine=xelatex

    # Check if the PDF was successfully created
    if [ $? -eq 0 ]; then
        echo "PDF successfully created: $OUTPUT_FILE"
    else
        echo "Error generating the PDF for $INPUT_FILE!"
    fi
done

# Return to the main directory
cd - > /dev/null

# Open all generated PDFs
for PDF_FILE in "$OUTPUT_DIR"/*.pdf; do
    xdg-open "$PDF_FILE"
done
