function differ_test02 ( )

%*****************************************************************************80
%
%% DIFFER_TEST02 tests DIFFER_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIFFER_TEST02\n' );
  fprintf ( 1, '  DIFFER_INVERSE returns the inverse of a DIFFER matrix;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N    Inverse error\n' );

  seed = 123456789;

  for n = 2 : 8

    fprintf ( 1, '\n' );

    for test = 1 : 5
      [ x, seed ] = r8vec_uniform_01 ( n, seed );
      a = differ_matrix ( n, x );
      b = differ_inverse ( n, x );
      err = inverse_error ( n, a, b );
      fprintf ( 1, '  %2d    %g\n', n, err );
    end

  end

  return
end
