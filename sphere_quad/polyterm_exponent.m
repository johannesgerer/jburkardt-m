function e = polyterm_exponent ( action, e )

%*****************************************************************************80
%
%% POLYTERM_EXPONENT gets or sets the exponents for the polynomial term.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION.
%    'GET' asks the routine to return the current values in E.
%    'SET' asks the routine to set the current values to E.
%
%    Input/output, integer E(3), storage used to set or get values.
%
  persistent e_save

  if ( s_eqi ( action, 'GET' ) )

    e(1:3) = e_save(1:3);

  elseif ( s_eqi ( action, 'PRINT' ) )

    fprintf ( 1, '\n' );

    if ( all ( e_save(1:3) == 0 ) )

      fprintf ( 1, 'P(X,Y,Z) = 1' );

    else

      fprintf ( 'P(X,Y,Z) = ' );

      if ( e_save(1) == 0 )

      elseif ( e_save(1) == 1 )

        fprintf ( 1, 'X ' );

      else

        fprintf ( 1, 'X^%d', e_save(1) );

      end

      if ( e_save(2) == 0 )

      elseif ( e_save(2) == 1 )

        fprintf ( 1, ' Y ' );

      else

        fprintf ( 1, ' Y^%d', e_save(2) );

      end
       
      if ( e_save(3) == 0 )

      elseif ( e_save(3) == 1 )

        fprintf ( 1, ' Z' );

      else

        fprintf ( 1, ' Z^%d', e_save(3) );

      end
 
    end

    fprintf ( 1, '\n' );

  elseif ( s_eqi ( action, 'SET' ) )

    e_save(1:3) = e(1:3);

  end

  return
end
