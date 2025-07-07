#!/bin/bash

# Rutas
INPUT_GIF="images/mp-dice.gif"
TEMP_DIR="temp"
OUTPUT_DIR="output"
FINAL_GIF="output/final.gif"

# Crear carpetas
mkdir -p "$TEMP_DIR" "$OUTPUT_DIR"

echo "🧩 Extrayendo frames del GIF..."
ffmpeg -y -i "$INPUT_GIF" -vsync 0 "$TEMP_DIR/temp%d.png"

echo "✨ Aplicando transparencia (50%) a cada frame..."
for img in "$TEMP_DIR"/*.png; do
  name=$(basename "$img")
  ffmpeg -y -i "$img" -vf "format=rgba,colorchannelmixer=aa=0.5" "$OUTPUT_DIR/$name"
done

echo "🎞️ Generando GIF final..."
ffmpeg -y -framerate 10 -i "$OUTPUT_DIR/temp%d.png" -vf "palettegen" "$OUTPUT_DIR/palette.png"
ffmpeg -y -framerate 10 -i "$OUTPUT_DIR/temp%d.png" -i "$OUTPUT_DIR/palette.png" \
  -lavfi "paletteuse" "$FINAL_GIF"

echo "✅ GIF generado: $FINAL_GIF"

