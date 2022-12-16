INPUT_PATH_OR_FILE=Document/presi_images/drawio
OUTPUT_PDF=Document/presi_images/pdf

drawio -r --export --format pdf --crop --output $OUTPUT_PDF  $INPUT_PATH_OR_FILE
