dist_dir="dist/"
prefix="jangal-logo"
src_svg="src/jangal-logo.svg"
square_sizes=(16 32 48 62 98 100 110 128 152 168 180 192 250 256 400 300 500)

# Clear distribution directory
rm "${dist_dir}*"

# Build squares
for i in "${square_sizes[@]}"
do	
	filename="${dist_dir}${prefix}-${i}x${i}"
	inkscape -z -e "${filename}.png" -w $i -h $i "${src_svg}"
	mogrify -format jpg -background white -flatten "${filename}.png"
	mv "${filename}.jpg" "${filename}-white.jpg"
	mogrify -format jpg -background black -flatten "${filename}.png"
	mv "${filename}.jpg" "${filename}-black.jpg"
	icotool -c -o "${filename}.ico" "${filename}.png"
done

# Build plain SVG
inkscape -l "${dist_dir}${prefix}.plain.svg" "${src_svg}"
