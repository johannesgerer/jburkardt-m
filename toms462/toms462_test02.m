function toms462_test02 ( )

%*****************************************************************************80
%
%% TOMS462_TEST02 tests BIVNOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 May 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS462_TEST02\n' );
  fprintf ( 1, '  Compare BIVNOR with some tabulated data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          Y          ' );
  fprintf ( 1, 'R           P                         P' );
  fprintf ( 1, '                      DIFF\n' );
  fprintf ( 1, '                                ' );
  fprintf ( 1, '       (Tabulated)               (BIVNOR)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, r, fxy1 ] = bivariate_normal_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end
%
%  BIVNOR computes the "tail" of the probability, and we want the
%  initial part so take a short cut and just pass in the negatives of X and Y.
%
    fxy2 = bivnor ( - x, - y, r );

    fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %24.16g  %24.16g  %10.4g\n', ...
       x, y, r, fxy1, fxy2, abs ( fxy1 - fxy2 ) );

  end

  return
end
