function value = i4_btest ( i4, pos )

%*****************************************************************************80
%
%% I4_BTEST returns TRUE if the POS-th bit of an I4 is 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Military Standard 1753,
%    FORTRAN, DoD Supplement To American National Standard X3.9-1978,
%    9 November 1978.
%
%  Parameters:
%
%    Input, integer I4, the integer to be tested.
%
%    Input, integer POS, the bit position, between 0 and 31.
%
%    Output, logical VALUE, is TRUE if the POS-th bit of I4 is 1.
%
  if ( pos < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_BTEST - Fatal error!\n' );
    fprintf ( 1, '  POS < 0.\n' );
    error ( 'I4_BTEST - Fatal error!' );

  elseif ( pos < 31 )

    if ( 0 <= i4 )
      j = floor ( i4 );
    else
      j = floor ( ( i4_huge ( ) + i4 ) + 1 );
    end

    for k = 1 : pos
      j = floor ( j / 2 );
    end

    if ( mod ( j, 2 ) == 0 )
      value = 0;
    else
      value = 1;
    end

  elseif ( pos == 31 )

    if ( i4 < 0 )
      value = 1;
    else
      value = 0;
    end

  elseif ( 31 < pos )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_BTEST - Fatal error!\n' );
    fprintf ( 1, '  31 < POS.\n' );
    error ( 'I4_BTEST - Fatal error!' );

  end

  return
end
