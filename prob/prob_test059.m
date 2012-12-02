function prob_test059 ( )

%*****************************************************************************80
%
%% TEST059 tests ERROR_F and ERROR_F_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST059\n' );
  fprintf ( 1, '  ERROR_F evaluates the error function ERF.\n' );
  fprintf ( 1, '  ERROR_F_INVERSE inverts the error function ERF.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'X   -> Y = error_F(X) -> Z = error_f_inverse(Y)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 20

    [ x, seed ] = normal_01_sample ( seed );
    y = error_f ( x );
    z = error_f_inverse ( y );
    fprintf ( 1, '  %14f  %14f  %14f\n', x, y, z );

  end

  return
end
