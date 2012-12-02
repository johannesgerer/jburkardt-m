function subset_test084 ( )

%*****************************************************************************80
%
%% TEST084 tests PELL_BASIC, PELL_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST084\n' );
  fprintf ( 1, '  PELL_BASIC solves the basic Pell equation.\n' );
  fprintf ( 1, '  PELL_NEXT computes the "next" solution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       D       X        Y         R\n' );
  fprintf ( 1, '\n' );

  for d = 2 : 20

    [ q, r ] = i4_sqrt ( d );

    if ( r ~= 0 )

      [ x0, y0 ] = pell_basic ( d );

      r = x0^2 - d * y0^2;

      fprintf ( 1, '  %7d  %7d  %7d  %7d\n', d, x0, y0, r );

      [ x1, y1 ] = pell_next ( d, x0, y0, x0, y0 );

      r = x1^2 - d * y1^2;

      fprintf ( 1, '           %7d  %7d  %7d\n', x1, y1, r );

    end

  end

  return
end
