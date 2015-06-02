function i4_characteristic_test ( )

%*****************************************************************************80
%
%% I4_CHARACTERISTIC_TEST tests I4_CHARACTERISTIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_CHARACTERISTIC_TEST\n' );
  fprintf ( 1, '  I4_CHARACTERISTIC computes the characteristic\n' );
  fprintf ( 1, '  of an integer Q, which is\n' );
  fprintf ( 1, '    Q if Q is prime;\n' );
  fprintf ( 1, '    P, if Q = P**N for some prime P;\n' );
  fprintf ( 1, '    0, if Q is negative, 0, 1, or the product of\n' );
  fprintf ( 1, '      more than 1 distinct prime.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, I4_CHARACTERISTIC\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 50
    fprintf ( 1, '  %2d  %4d\n', i, i4_characteristic ( i ) );
  end

  return
end
