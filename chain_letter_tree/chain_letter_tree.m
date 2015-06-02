function chain_letter_tree ( )

%*****************************************************************************80
%
%% CHAIN_LETTER_TREE gathers the chain letter results and plots them.
%
%  Discussion:
%
%    Students were given 11 chain letters.  Each student was asked to pick
%    a particular chain letter, and then estimate its "distance" from all
%    the chain letters, using a particular scoring system.  
%
%    The results are here assembled into a distance matrix, from which a
%    hierarchical clustering can be made and displayed.
%
%    The distances were based on comparing positions in thw chain letters where
%    a proper name occurred.
%
%    "New England"   0 if the same, 1 otherwise.
%    "R.A.F.Officer" 0 if the same, 1 otherwise.
%    "Gene Welch" 0 if the same, 1 if one name different, 2 if both different.
%    "Saul de Groda" 0 if the same, 1, 2 or 3 if 1, 2 or 3 names different or added.
%    "Constantine Dias" 0 if the same, 1 or 2 if 1 or 2 names different.
%    "Carlos Daddit" 0 if the same, 1 or 2 if 1 or 2 names different.
%    "Dalan Fairchild" 0 if the same, 1 or 2 if 1 or 2 names different.
%    "a young woman in California" 0 if both letters have or don't have this part, 
%      5 if one does and one doesn't.
%
%    The distance between the two chain letters is the sum of the 8 scores.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHAIN_LETTER_TREE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Construct a dendrogram to analyze the relationship\n' );
  fprintf ( 1, '  among a set of 11 versions of a chain letter.\n' );

  dist = zeros(11,11);
  count = zeros(11,1);
%
%  Shortcuts for the names of the chain letters.
%
  a = 1;
  b = 2;
  c = 3;
  d = 4;
  e = 5;
  f = 6;
  g = 7;
  h = 8;
  i = 9;
  j = 10;
  k = 11;
%
%  We received a number of reports for particular rows of the distance matrix.
%  To make it easy to check and correct this data, we have preserved each
%  report.  By counting how many reports were given for a particular row,
%  we can average at the end to get a single estimated value for each row.
%
  count(a) = count(a) + 1;
  dist(a,1:11) = dist(a,1:11) + [  0,  9,  9,  9,  7,  6, 14,  9, 15, 14, 10 ];

  count(a) = count(a) + 1;
  dist(a,1:11) = dist(a,1:11) + [  0,  8,  8,  8,  7,  7,  9,  9, 14, 13,  9 ];

  count(a) = count(a) + 1;
  dist(a,1:11) = dist(a,1:11) + [  0,  9,  9, 10,  9,  7, 16,  9, 14, 13, 11 ];

  count(a) = count(a) + 1;
  dist(a,1:11) = dist(a,1:11) + [  0, 14, 10, 12,  2, 10, 10,  8, 10,  5,  9 ];

  count(a) = count(a) + 1;
  dist(a,1:11) = dist(a,1:11) + [  0,  8,  8, 10,  7,  6, 16,  9, 15, 13,  8 ];

  count(b) = count(b) + 1;
  dist(b,1:11) = dist(b,1:11) + [  7,  0, 10,  8, 10,  6, 18, 10, 15, 12,  8 ];

  count(b) = count(b) + 1;
  dist(b,1:11) = dist(b,1:11) + [ 10,  0, 10,  7, 10,  6, 18, 10, 16, 12,  8 ];

  count(c) = count(c) + 1;
  dist(c,1:11) = dist(c,1:11) + [ 12,  9,  0, 11,  9,  7, 17, 11, 14, 15, 11 ];

  count(c) = count(c) + 1;
  dist(c,1:11) = dist(c,1:11) + [  8,  7,  0,  2,  8,  7, 15,  8, 12, 12,  3 ];

  count(d) = count(d) + 1;
  dist(d,1:11) = dist(d,1:11) + [  9,  7,  9,  0,  9,  8, 14,  9, 14, 12,  0 ];

  count(d) = count(d) + 1;
  dist(d,1:11) = dist(d,1:11) + [  8,  7, 10,  0,  8,  7, 17,  9, 14, 13,  0 ];

  count(e) = count(e) + 1;
  dist(e,1:11) = dist(e,1:11) + [  7, 10,  9,  8,  0,  9, 16, 10, 13, 13,  8 ];

  count(f) = count(f) + 1;
  dist(f,1:11) = dist(f,1:11) + [  6,  6,  7,  7,  9,  0, 17,  9, 10, 12,  7 ];

  count(g) = count(g) + 1;
  dist(g,1:11) = dist(g,1:11) + [ 12, 18, 14, 12, 16, 11,  0, 16, 11,  9, 12 ];

  count(h) = count(h) + 1;
  dist(h,1:11) = dist(h,1:11) + [ 12, 12, 12,  9, 12, 12, 16,  0, 15, 17,  8 ];

  count(i) = count(i) + 1;
  dist(i,1:11) = dist(i,1:11) + [ 15, 15, 14, 14, 13, 14, 12, 15,  0,  9, 14 ];

  count(j) = count(j) + 1;
  dist(j,1:11) = dist(j,1:11) + [ 12, 12, 15, 13, 13, 12, 12, 14,  9,  0, 13 ];

  count(k) = count(k) + 1;
  dist(k,1:11) = dist(k,1:11) + [  8,  7, 10,  0,  7,  9, 14,  9,  9,  8,  0 ];
%
%  Average the rows.
%
  for row = a : k
    if ( 0 < count(row) )
      dist(row,a:k) = dist(row,a:k) / count(row);
    end
  end
%
%  Make the matrix symmetric.
%
  for row = a : k
    for col = a : row - 1
      rc = dist(row,col);
      cr = dist(col,row);
      dist(row,col) = ( rc + cr ) / 2.0;
      dist(col,row) = ( rc + cr ) / 2.0;
    end
  end
%
%  Print the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Chain Letter Distance Table (Symmetrized and Averaged)\n' );
  fprintf ( 1, '\n' );

  for row = a : k
    for col = a : k
      fprintf ( 1, '  %5.2f', dist(row,col) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Write the matrix to a file.
%
  filename = 'chain_letter_distance.txt';

  output = fopen ( filename, 'wt' );

  for row = a : k
    for col = a : k
      fprintf ( output, '  %5.2f', dist(row,col) );
    end
    fprintf ( output, '\n' );
  end

  fclose ( output );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Distance matrix written to file "%s"\n', filename );
%
%  Matlab's Statistical Toolbox can create a distance vector from a distance matrix,
%  then apply single linkage clustering to that to create a tree structure, and then
%  create a plot of the tree structure.
%
  dv = pdist ( dist );
  dl = linkage ( dv, 'single' );
  dendrogram ( dl )
  title ( 'Dendogram for 11 chain letters A=1 through K=11' );
%
%  Save a copy of the plot to a file.
%
  filename = 'chain_letter_tree.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved the dendrogram plot as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHAIN_LETTER_TREE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
