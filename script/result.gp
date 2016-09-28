reset
set ylabel 'time(micro_sec)'
set style fill solid
set title 'clz perfomance comparison'
set term png enhanced font 'Verdana,10'
set output 'output/result.png'

plot [:][0:5] 'output/output_recursive.txt' using 1:2 with points title "rec",\
     'output/output_binary_search.txt'  using 1:2 with points title "bs",\
     'output/output_harley.txt'  using 1:2 with points title "har",\
	 'output/output_byte_shift.txt'  using 1:2 with points title "bt",\
	 'output/output_iteration.txt'  using 1:2 with points title "it"


#using 2:xtic(1) with histogram title 'original', \
#'' using 3:xtic(1) with histogram title 'optimized1' ,\
#'' using 4:xtic(1) with histogram title 'optimized2' ,\
#'' using ($0-0.06):($2+0.0015):2 with labels title '', \
#'' using ($0+0.2):($3+0.0015):3 with labels title '', \
#'' using ($0+0.4):($4+0.0015):4 with labels title ''
