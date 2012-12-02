function blend_test04 ( )

%*****************************************************************************80
%
%% BLEND_TEST04 checks out BLEND_IJ_0D1 and BLEND_IJ_1D1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
  m1 = 5;
  m2 = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST04\n' );
  fprintf ( 1, '  BLEND_IJ_0D1 interpolates data in a table,\n' );
  fprintf ( 1, '  from corner data.\n' );
  fprintf ( 1, '  BLEND_IJ_1D1 interpolates data in a table,\n' );
  fprintf ( 1, '  from edge data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The table is %d rows by %d columns.\n', m1, m2 );

  x = zeros ( m1, m2 );
%
%  Load data in the corners only.
%
  i = 1;
  j = 1;
  r = (  i - 1 ) / ( m1 - 1 );
  s = (  j - 1 ) / ( m2 - 1 );
  x(i,j) = cubic_rs ( r, s, 1 );

  i = m1;
  j = 1;
  r = (  i - 1 ) / ( m1 - 1 );
  s = (  j - 1 ) / ( m2 - 1 );
  x(i,j) = cubic_rs ( r, s, 1 );

  i = 1;
  j = m2;
  r = (  i - 1 ) / ( m1 - 1 );
  s = (  j - 1 ) / ( m2 - 1 );
  x(i,j) = cubic_rs ( r, s, 1 );

  i = m1;
  j = m2;
  r = (  i - 1 ) / ( m1 - 1 );
  s = (  j - 1 ) / ( m2 - 1 );
  x(i,j) = cubic_rs ( r, s, 1 );

  x = blend_ij_0d1 ( x, m1, m2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Values interpolated by BLEND_IJ_0D1:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m1
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i,1:m2) );
  end
%
%  Load data in the edges.
%
  j = 1;
  for i = 1 : m1
    r = (  i - 1 ) / ( m1 - 1 );
    s = (  j - 1 ) / ( m2 - 1 );
    x(i,j) = cubic_rs ( r, s, 1 );
  end

  j = m2;
  for i = 1 : m1
    r = (  i - 1 ) / ( m1 - 1 );
    s = (  j - 1 ) / ( m2 - 1 );
    x(i,j) = cubic_rs ( r, s, 1 );
  end

  i = 1;
  for j = 2 : m2 - 1
    r = (  i - 1 ) / ( m1 - 1 );
    s = (  j - 1 ) / ( m2 - 1 );
    x(i,j) = cubic_rs ( r, s, 1 );
  end

  i = m1;
  for j = 2 : m2 - 1
    r = (  i - 1 ) / ( m1 - 1 );
    s = (  j - 1 ) / ( m2 - 1 );
    x(i,j) = cubic_rs ( r, s, 1 );
  end

  x = blend_ij_1d1 ( x, m1, m2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Values interpolated by BLEND_IJ_1D1:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m1
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i,1:m2) );
  end
%
%  Compare with BLEND_RS_1D1
%
  for i = 1 : m1
    r = (  i - 1 ) / ( m1 - 1 );
    for j = 1 : m2
      s = (  j - 1 ) / ( m2 - 1 );
      x(i,j) = blend_rs_1dn ( r, s, 1, @cubic_rs );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data blended by BLEND_RS_1DN:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m1
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i,1:m2) );
  end
%
%  Load all data.
%
  for i = 1 : m1
    for j = 1 : m2
      r = (  i - 1 ) / ( m1 - 1 );
      s = (  j - 1 ) / ( m2 - 1 );
      x(i,j) = cubic_rs ( r, s, 1 );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Exact data:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : m1
    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', x(i,1:m2) );
  end

  return
end
