function cardinal_sin_test ( )

%*****************************************************************************80
%
%% CARDINAL_SIN_TEST tests CARDINAL_SIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CARDINAL_SIN_TEST\n' );
  fprintf ( 1, '  CARDINAL_SIN evaluates cardinal sine functions.\n' );
  fprintf ( 1, '  Si(Tj) = Delta(i,j), where Tj = cos(pi*i/(n+1)).\n' );
  fprintf ( 1, '  A simple check of all pairs should form the identity matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The CARDINAL_SIN test matrix:\n' );
  fprintf ( 1, '\n' );
  m = 11;
  n = m + 2;
  s = zeros ( m + 2, m + 2 );
  t_lo = 0.0;
  t_hi = pi;
  t = linspace ( t_lo, t_hi, n );
  for j = 0 : m + 1
    s(1:m+2,j+1) = cardinal_sin ( j, m, n, t );
  end

  for i = 1,  n
    for j = 0 : m + 1
      fprintf ( 1, '  %4.1f', s(i,j+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
  
