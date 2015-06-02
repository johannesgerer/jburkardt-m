function i4_div_rounded_test ( )

%*****************************************************************************80
%
%% I4_DIV_ROUNDED_TEST tests I4_DIV_ROUNDED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
  a_hi =  100;
  a_lo = -100;
  b_hi =  10;
  b_lo = -10;
  test_num = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_DIV_ROUNDED_TEST\n' );
  fprintf ( 1, '  I4_DIV_ROUNDED performs rounded integer division.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  C0 = int ( a / b )\n' );
  fprintf ( 1, '  C1 = I4_DIV_ROUNDED ( A, B )\n' );
  fprintf ( 1, '  C2 = nint ( a / b )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A     B           C0         C1    C2\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num
    [ a, seed ] = i4_uniform_ab ( a_lo, a_hi, seed );
    [ b, seed ] = i4_uniform_ab ( b_lo, b_hi, seed );
    if ( b == 0 )
      b = 7;
    end
    c0 = floor ( a / b );
    c1 = i4_div_rounded ( a, b );
    c2 = round ( a / b );
    fprintf ( 1, '  %4d  %4d  %4d  %4d  %4d\n', a, b, c0, c1, c2 );
  end

  return
end
