function test129 ( )

%*****************************************************************************80
%
%% TEST129 test R8POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST129\n' );
  fprintf ( 1, '  R8POLY converts between power sum, factorial\n' );
  fprintf ( 1, '  and Taylor forms, and can evaluate a polynomial\n' );
  fprintf ( 1, '\n' );
 
  for test = 1 : 6

    if ( test == 1 )
      iopt = -3;
      x0 = [];
    elseif ( test == 2 )
      iopt = -2;
      x0 = [];
    elseif ( test == 3 )
      iopt = -1;
      x0 = 2.0;
    elseif ( test == 4 )
      iopt = 0;
      x0 = 2.0;
    elseif ( test == 5 )
      iopt = 6;
      x0 = 2.0;
    elseif ( test == 6 )
      iopt = 6;
      x0 = -2.0;
    end

    a(1:n) = [ 0.0, 0.0, 0.0, 0.0, 0.0, 1.0 ];

    if ( test == 1 )
      fprintf ( 1, '  All calls have input A as follows:\n' );
      for i = 1 : n
        fprintf ( 1, '  %7f', a(i) );
      end
      fprintf ( 1, '\n' );
    end
 
    [ a, val ] = r8poly ( n, a, x0, iopt );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Option IOPT = %d\n', iopt );
    if ( -1 <= iopt )
      fprintf ( 1, '  X0 = %f\n', x0 );
    end

    if ( iopt == -3 | iopt == -2 | 0 < iopt )
      fprintf ( 1, '  Output array = \n' );
      for i = 1 : n
        fprintf ( 1, '  %7f', a(i) );
      end
      fprintf ( 1, '\n' );
    end

    if ( iopt == -1 | iopt == 0 )
      fprintf ( 1, '  Value = %f\n', val );
    end
 
  end

  return
end
