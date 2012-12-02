function asa113_test01 ( )

%*****************************************************************************80
%
%% TEST01 tries out the ASA113 routine.
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
  fprintf ( 1, '  Test the ASA113 classification algorithm.\n' );
%
%  Read the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reading the data.\n' );

  input_unit = fopen ( 'points_100.txt', 'rt' );

  for i = 1 : m
    a(i,1:n) = fscanf ( input_unit, '%f', n );
  end

  fclose ( input_unit );
%
%  Print first five points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First five points:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 5
    fprintf ( 1, '  %8d', i );
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Assign points randomly to classes.
%
  for i = 1 : m
    c(i) = mod ( i, k ) + 1;
  end
%
%  Define the critical value as the sum of the squares of the distances
%  of the points to their cluster center.
%
  for i = 1 : k
    c_size(i) = 0;
    for j = 1 : n
      c_center(i,j) = 0.0;
    end
  end

  for i = 1 : m
    ci = c(i);
    c_size(ci) = c_size(ci) + 1;
    for j = 1 : n
      c_center(ci,j) = c_center(ci,j) + a(i,j);
    end
  end

  for i = 1 : k
    for j = 1 : n
      c_center(i,j) = c_center(i,j) / c_size(i);
    end
  end

  for i = 1 : k
    wss(i) = 0.0;
  end

  for i = 1 : m
    ci = c(i);
    for j = 1 : n
      wss(ci) = wss(ci) + ( a(i,j) - c_center(ci,j) )^2;
    end
  end

  critvl = 0.0;
  for i = 1 : k
    critvl = critvl + wss(i);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '        Initial CRITVL = %f\n', critvl );
%
%  Compute the clusters.
%
  ntrans1 = -1;
  ntrans2 = -1;

  while ( 1 )

    [ c, c_size, critvl, ntrans1, ifault ] = trnsfr ( a, c, c_size, m, k, ...
      n, critvl );

    if ( ntrans1 == 0 & ntrans2 == 0 )
      break
    end

    fprintf ( 1, '  After TRNSFR, CRITVL = %f\n', critvl );

    [ c, c_size, critvl, ntrans2, ifault ] = swap ( a, c, c_size, m, k, n, ...
      critvl );

    if ( ntrans1 == 0 & ntrans2 == 0 )
      break
    end

    fprintf ( 1, '    After SWAP, CRITVL = %f\n', critvl );

  end
%
%  Define the critical value as the sum of the squares of the distances
%  of the points to their cluster center.
%
  for i = 1 : k
    for j = 1 : n
      c_center(i,j) = 0.0;
    end
  end

  for i = 1 : m
    ci = c(i);
    for j = 1 : n
      c_center(ci,j) = c_center(ci,j) + a(i,j);
    end
  end

  for i = 1 : k
    for j = 1 : n
      c_center(i,j) = c_center(i,j) / c_size(i);
    end
  end

  for i = 1 : k
    wss(i) = 0.0;
  end

  for i = 1 : m
    ci = c(i);
    for j = 1 : n
      wss(ci) = wss(ci) + ( a(i,j) - c_center(ci,j) )^2;
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cluster  Population  Energy\n' );
  fprintf ( 1, '\n' );

  for i = 1 : k
    fprintf ( 1, '  %8d  %8d  %14f\n', i, c_size(i), wss(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Total  %8d  %14f\n', m, critvl );

  return
end
