mkdir -p dist
deno compile --allow-write --allow-read --allow-env --allow-run --import-map import_map.json --unstable --output dist/my-config src/main.ts
