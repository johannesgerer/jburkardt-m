function subset_test064 ( )

%*****************************************************************************80
%
%% TEST064 test I4POLY.
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
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST064\n' );
  fprintf ( 1, '  I4POLY converts between power sum, factorial\n' );
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
      x0 = 2;
    elseif ( test == 4 )
      iopt = 0;
      x0 = 2;
    elseif ( test == 5 )
      iopt = 6;
      x0 = 2;
    elseif ( test == 6 )
      iopt = 6;
      x0 = -2;
    end

    a = [ 0, 0, 0, 0, 0, 1 ];

    if ( test == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  All calls have input A as follows:\n' );
      for i = 1 : n
        fprintf ( 1, '  %2d', a(i) );
      end
      fprintf ( 1, '\n' );
    end
 
    [ a, val ] = i4poly ( n, a, x0, iopt );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Option IOPT = %d\n', iopt );
    if ( -1 <= iopt )
      fprintf ( 1, '  X0 = %d\n', x0 );
    end
    if ( iopt == -3 | iopt == -2 | 0 < iopt )
      fprintf ( 1, '  Output array:\n' );
      for i = 1 : n
        fprintf ( 1, '  %2d', a(i) );
      end
      fprintf ( 1, '\n' );
    end
    if ( iopt == -1 | iopt == 0 )
      fprintf ( 1, '  Value = %d\n', val );
    end
 
  end

  return
end
