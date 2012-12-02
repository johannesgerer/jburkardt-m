function polpak_test0035 ( )

%*****************************************************************************80
%
%% TEST0035 tests ARC_COSINE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0035\n' );
  fprintf ( 1, '  ARC_COSINE computes the inverse cosine\n' );
  fprintf ( 1, '  of a given value, and chops out of bound arguments.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X       ARC_COSINE(X)   COS(ARC_COSINE(X))\n' );
  fprintf ( 1, '\n' );

  for i = -5 : 5
    x = 1.0 + i / 5.0;
    a = arc_cosine ( x );
    x2 = cos ( a );
    fprintf ( 1, '  %12f  %12f  %12f\n', x, a, x2 );
  end

  return
end
