function walsh_test02 ( )

%*****************************************************************************80
%
%% WALSH_TEST02 tests WALSH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2011
%
%  Author:
%
%    John Burkardt
%
  n = 16;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WALSH_TEST02\n' );
  fprintf ( 1, '  WALSH computes a fast Walsh transform.\n' );

  for j = 1 : 2

    if ( j == 1 )
      seed = 123456789;
      [ w, seed ] = r8vec_uniform_01 ( n, seed );
    else
      w(1:n) = 1 : n;
    end

    x(1:n) = w(1:n);
    w = walsh ( n, w );
    y(1:n) = w(1:n) / n;
    w = walsh ( n, w );
    z(1:n) = w(1:n) / n;

    fprintf ( 1, '\n' );
    fprintf ( 1, '     I        X(I)    Y=FWT(X)/N   Z=FWT(Y)/N\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %4d  %10f  %10f  %10f\n', i, x(i), y(i), z(i) );
    end

  end

  return
end
