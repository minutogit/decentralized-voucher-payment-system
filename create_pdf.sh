#!/bin/bash

# Directories
SRC_DIR="src"
OUTPUT_DIR="output"

# File names for input and output
INPUT_FILE="Gutschein-Zahlungssystem.md"
OUTPUT_FILE="../$OUTPUT_DIR/Gutschein-Zahlungssystem.pdf"

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Change to the source directory
cd "$SRC_DIR" || exit 1

# Generate PDF using Pandoc & XeLaTeX
echo "Generating PDF with Pandoc..."
pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --pdf-engine=xelatex

# Return to the main directory
cd - > /dev/null

# Check if the PDF was successfully created
if [ $? -eq 0 ]; then
    echo "PDF successfully created: $OUTPUT_FILE"
    xdg-open "$OUTPUT_DIR/Gutschein-Zahlungssystem.pdf"
else
    echo "Error generating the PDF!"
    exit 1
fi
