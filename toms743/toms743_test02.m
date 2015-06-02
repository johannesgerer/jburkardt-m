function toms743_test02 ( nbits, dx, n )

%*****************************************************************************80
%
%% TOMS743_TEST02 tests WAPR(X) when X is the offset of the argument from -exp(-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Andrew Barry, S. J. Barry, 
%    Patricia Culligan-Hensley.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer NBITS, the number of bits in the mantissa.
%
%    Input, real DX, the initial offset.
%
%    Input, integer N, the number of offset arguments to generate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS743_TEST02\n' );
  fprintf ( 1, '  Input X is the offset from -exp(-1).\n' );

  l = 1;
  ifmt = 0;
  xmax = n * dx - exp ( -1.0 );
  xmin = 0.0;

  if ( xmax <= 0.0 )
    iw = 1;
    fprintf ( 1, '  Both branches of the W function will be checked.\n' );
  else
    iw = 0;
    fprintf ( 1, '  Wp has been selected (maximum x is > 0)\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Results for Wp(x):\n' );

  if ( ifmt == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '   Offset x    W(x) (WAPR)' );
    fprintf ( 1, '     W(x) (BISECT)  Digits Correct\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '     x     W(x) (WAPR)' );
    fprintf ( 1, '     W(x) (BISECT)  Digits Correct\n' );
  end

  fprintf ( 1, '\n' );

  for i = 1 : n + 1

    x = xmin + i * dx;
    [ w, nerror ] = wapr ( x, 0, l );

    if ( nerror == 1 )

      fprintf ( 1, '  The value of X = %g is out of range.\n', x );

    else

      [ we, ner ] = bisect ( x, 0, l );

      if ( ner == 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, ' BISECT did not converge for x = %g\n', x );
        fprintf ( 1, '  Try reducing NBITS.\n' );
      end

      if ( w == we )
        nd = floor ( log10 ( 2.0 ^ nbits ) + 0.5 );
      else
        nd = floor ( log10 ( abs ( we / ( w - we ) ) ) + 0.5 );
      end

      fprintf ( 1, '%17.8g      %17.8g      %17.8g      %3d\n', x, w, we, nd );

    end

  end

  if ( iw == 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Results for Wm(x):\n' );

    if ( ifmt == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '   Offset x    W(x) (WAPR)' );
      fprintf ( 1, '     W(x) (BISECT)  Digits Correct\n' );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, '     x     W(x) (WAPR)' );
      fprintf ( 1, '     W(x) (BISECT)  Digits Correct\n' );
    end

    fprintf ( 1, '\n' );

    for i = 1 : n + 1

      x = xmin + i * dx;
      [ w, nerror ] = wapr ( x, 1, l );

      if ( nerror == 1 )

        fprintf ( 1, '  The value of X = %g is out of range.\n', x );

      else

        [ we, ner ] = bisect ( x, 1, l );

        if ( ner == 1 )
          fprintf ( 1, '\n' );
          fprintf ( 1, ' BISECT did not converge for x = %g\n', x );
          fprintf ( 1, '  Try reducing NBITS.\n' );
        end
  
        if ( w == we )
          nd = floor ( log10 ( 2.0 ^ nbits ) + 0.5 );
        else
          nd = floor ( log10 ( abs ( we / ( w - we ) ) ) + 0.5 );
        end

        fprintf ( 1, '%17.8g      %17.8g      %17.8g      %3d\n', x, w, we, nd );

      end

    end

  end

  return
end
