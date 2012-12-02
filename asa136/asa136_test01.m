function asa136_test01 ( )

%*****************************************************************************80
%
%% TEST01 tries out the ASA136 routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  k = 5;
  m = 100;
  n = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Test the KMNS algorithm.\n' );
  fprintf ( 1, '  Applied Statistics Algorithm 136\n' );
%
%  Read the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the data.\n' );

  input_unit = fopen ( 'points_100.txt', 'rt' );

  for i = 1 : m
    x(i,1:n) = fscanf ( input_unit, '%f', n );
  end

  fclose ( input_unit );
%
%  Print a few data values.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 5 data values:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    fprintf ( 1, '  %8d', j );
    for j = 1 : n
      fprintf ( 1, '  %14f', x(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Initialize the cluster centers.
%  Here, we arbitrarily make the first K data points cluster centers.
%
  for i = 1 : k
    for j = 1 : n
      c(i,j) = x(i,j);
    end
  end
%
%  Compute the clusters.
%
  iter = 50;

 [ c, ic1, nc, wss, ifault ] = kmns ( x, m, n, c, k, iter );

  if ( ifault ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST01 - Fatal error!\n' );
    fprintf ( 1, '  KMNS returned IFAULT = %d\n', ifault );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cluster  Population  Energy\n' );
  fprintf ( 1, '\n' );

  for i = 1 : k
    fprintf ( 1, '  %8d  %8d  %14f\n', i, nc(i), wss(i) );
  end

  nc_sum = sum ( nc(1:k) );
  wss_sum = sum ( wss(1:k) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Total  %8d  %14f\n', nc_sum, wss_sum );

  return
end
