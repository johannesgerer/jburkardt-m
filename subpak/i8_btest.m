function value = i8_btest ( i, pos )

%*****************************************************************************80
%
%% I8_BTEST returns TRUE if bit #POS of I is 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    MIL-STD 1753
%
%  Parameters:
%
%    Input, integer I, the integer to be tested.
%
%    Input, integer POS, the bit position, between 0 and 63.
%
%    Output, logical VALUE, is TRUE if the POS-th bit of I is 1.
%
  if ( pos < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'I8_BTEST - Fatal error!\n' );
    fprintf ( 1, '  POS < 0.\n' );
    error ( 'I8_BTEST - Fatal error!' );

  elseif ( pos < 63 )

    j = i;
    for k = 1 : pos
      j = floor ( j / 2 );
    end

    if ( mod ( j, 2 ) == 0 )
      value = 0;
    else
      value = 1;
    end

  elseif ( pos == 63 )

    if ( i < 0 )
      value = 1;
    else
      value = 0;
    end

  elseif ( 63 < pos )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'I8_BTEST - Fatal error!\n' );
    fprintf ( 1, '  63 < POS.\n' );
    error ( 'I8_BTEST - Fatal error!' );

  end

  return
end
