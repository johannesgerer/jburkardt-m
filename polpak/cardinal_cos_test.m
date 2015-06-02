function cardinal_cos_test ( )

%*****************************************************************************80
%
%% CARDINAL_COS_TEST tests CARDINAL_COS.
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
  fprintf ( 1, 'CARDINAL_COS_TEST\n' );
  fprintf ( 1, '  CARDINAL_COS evaluates cardinal cosine functions.\n' );
  fprintf ( 1, '  Ci(Tj) = Delta(i,j), where Tj = cos(pi*i/(n+1)).\n' );
  fprintf ( 1, '  A simple check of all pairs should form the identity matrix.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The CARDINAL_COS test matrix:\n' );
  fprintf ( 1, '\n' );
  m = 11;
  n = m + 2;
  c = zeros ( m + 2, m + 2 );
  t_lo = 0.0;
  t_hi = pi;
  t = linspace ( t_lo, t_hi, n );
  for j = 0 : m + 1
    c(1:n,j+1) = cardinal_cos ( j, m, n, t );
  end

  for i = 1 : n
    for j = 0 : m + 1
      fprintf ( 1, '  %4.1f', c(i,j+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
  
