function r8_digit_test ( )

%*****************************************************************************80
%
%% R8_DIGIT_TEST tests R8_DIGIT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  maxdig = 20;

  x = pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_DIGIT_TEST\n' );
  fprintf ( 1, '  R8_DIGIT extracts decimal digits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we get digits of %f\n', x );
  fprintf ( 1, '\n' );

  fprintf ( 1, '  ' );
  
  for idigit = -1 : maxdig
    fprintf ( 1, '%3d', idigit );
  end
  fprintf ( 1, '\n' );

  fprintf ( 1, '  ' );
  for idigit = -2 : maxdig
    digit = r8_digit ( x, idigit );
    fprintf ( 1, '%3d', idigit );
  end
  fprintf ( 1, '\n' );

  return
end
