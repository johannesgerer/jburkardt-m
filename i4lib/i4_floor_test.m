function i4_floor_test ( )

%*****************************************************************************80
%
%% I4_FLOOR_TEST tests I4_FLOOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 September 2014
%
%  Author:
%
%    John Burkardt
%
  r8_lo = -100.0;
  r8_hi =  100.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_FLOOR_TEST\n' );
  fprintf ( 1, '  I4_FLOOR evaluates the "floor" of an R8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      R8    I4_FLOOR(R8)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r8, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
    i4 = i4_floor ( r8 );
    fprintf ( 1, '  %8.4f         %4d\n', r8, i4 );
  end
 
  return
end
