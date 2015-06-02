function r8_mop_test ( )

%*****************************************************************************80
%
%% R8_MOP_TEST tests R8_MOP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_MOP_TEST\n' );
  fprintf ( 1, '  R8_MOP evaluates (-1.0)^I4 as an R8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    I4  R8_MOP(I4)\n' );
  fprintf ( 1, '\n' );

  i4_min = -100;
  i4_max = +100;
  seed = 123456789;

  for test = 1 : 10
    [ i4, seed ] = i4_uniform_ab ( i4_min, i4_max, seed );
    r8 = r8_mop ( i4 );
    fprintf ( 1, '  %4d  %4.1f\n', i4, r8 );
  end

  return
end
