function blend_test03 ( )

%*****************************************************************************80
%
%% BLEND_TEST03 checks out BLEND_I_0D1.
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
  m = 5;

  x = zeros ( m );

  x(1) = 100.0;
  x(m) = 100.0 + ( m - 1 ) * 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST03\n' );
  fprintf ( 1, '  BLEND_I_0D1 interpolates data in a vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X(1) = %f\n', x(1) );
  fprintf ( 1, '  X(%d) = %f\n', m, x(m) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Interpolated values:\n' );
  fprintf ( 1, '\n' );

  x = blend_i_0d1 ( x, m );

  for i = 1 : m
    fprintf ( 1, '  %8d  %14f\n', i, x(i) );
  end

  return
end
