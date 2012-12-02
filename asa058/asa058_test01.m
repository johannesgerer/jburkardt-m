function asa058_test01 ( )

%*****************************************************************************80
%
%% TEST01 tries out the ASA058 routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2008
%
%  Author:
%
%    John Burkardt
%
  k = 5;
  m = 2;
  n = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  Test the CLUSTR algorithm.\n' );
  fprintf ( 1, '  Applied Statistics Algorithm 58\n' );
%
%  Read the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the data.\n' );

  input_unit = fopen ( 'points_100.txt', 'rt' );

  for i = 1 : n
    x(i,1:m) = fscanf ( input_unit, '%f', m );
  end

  fclose ( input_unit );
%
%  Print a few data values.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First 5 data values:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    fprintf ( 1, '  %8d', i );
    for j = 1 : m
      fprintf ( 1, '  %14f', x(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Initialize the cluster centers arbitrarily.
%
  for i = 1 : k
    for j = 1 : m
      d(i,j) = x(i,j);
    end
  end
%
%  Compute the clusters.
%
  nz = 1;
  k2 = k;

  [ d, dev, b, e ] = clustr ( x, d, n, m, k, nz, k2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cluster  Population  Energy\n' );
  fprintf ( 1, '\n' );

  for i = 1 : k
    fprintf ( 1, '  %8d  %8d  %14f\n', i, e(i), dev(i) );
  end

  e_sum = sum ( e(1:k) );
  dev_sum = sum ( dev(1:k) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Total  %8d  %14f\n', e_sum, dev_sum );

  return
end
