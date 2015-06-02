function cardinal_test ( )

%*****************************************************************************80
%
%% CARDINAL_TEST tests CARDINAL_COS and CARDINAL_SIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CARDINAL_TEST\n' );
  fprintf ( 1, '  CARDINAL_COS evaluates cardinal cosine functions.\n' );
  fprintf ( 1, '  CARDINAL_SIN evaluates cardinal sine functions.\n' );
  fprintf ( 1, '  Ci(Tj) = Delta(i,j), where Tj = cos(pi*i/(n+1)).\n' );
  fprintf ( 1, '  A simple check of all pairs should form the identity matrix.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The CARDINAL_COS test matrix:\n' );
  fprintf ( 1, '\n' );
  n = 11;
  c = zeros ( n + 2, n + 2 );
  t = ( 0 : n + 1 ) * pi / ( n + 1 );
  for j = 0 : n + 1
    c(1:n+2,j+1) = cardinal_cos ( j, n, t );
  end

  for i = 0 : n + 1
    for j = 0 : n + 1
      fprintf ( 1, '  %4.1f', c(i+1,j+1) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The CARDINAL_SIN test matrix:\n' );
  fprintf ( 1, '\n' );
  n = 11;
  s = zeros ( n + 2, n + 2 );
  t = ( 0 : n + 1 ) * pi / ( n + 1 );
  for j = 0 : n + 1
    s(1:n+2,j+1) = cardinal_sin ( j, n, t );
  end

  for i = 0 : n + 1
    for j = 0 : n + 1
      fprintf ( 1, '  %4.1f', s(i+1,j+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
  
