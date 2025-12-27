echo "Deleting the contents of the working directories..."
rm -rf work/*
rm -rf out/*
echo "Deletion complete."
echo "Building iso:"
mkarchiso -v -w work/ -o out/ .
