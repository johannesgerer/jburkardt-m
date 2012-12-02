function walsh_test03 ( )

%*****************************************************************************80
%
%% WALSH_TEST03 tests HAAR, HAARIN and HNORM.
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
  fprintf ( 1, 'WALSH_TEST03\n' );
  fprintf ( 1, '  HAAR computes a Haar transform.\n' );
  fprintf ( 1, '  HNORM normalizes the transformed data.\n' );
  fprintf ( 1, '  HAARIN computes an inverse Haar transform.\n' );

  for j = 1 : 2

    if ( j == 1 )
      seed = 123456789;
      [ w, seed ] = r8vec_uniform_01 ( n, seed );
    else
      w(1:n) = 1 : n;
    end

    x(1:n) = w(1:n);

    w = haar ( n, w );

    y(1:n) = w(1:n);

    w = hnorm ( n, w );

    z(1:n) = w(1:n);

    w = haarin ( n, w );

    fprintf ( 1, '\n' );
    fprintf ( 1, '     I        X(I)    Y=HAAR(X)  Z=HNORM(Y)  W=HAARIN(Z)\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %4d  %10f  %10f  %10f  %10f\n', i, x(i), y(i), z(i), w(i) );
    end

  end

  return
end
