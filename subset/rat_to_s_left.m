function s = rat_to_s_left ( a, b )

%*****************************************************************************80
%
%% RAT_TO_S_LEFT returns a left-justified representation of A/B.
%
%  Discussion:
%
%    If the ratio is negative, a minus sign precedes A.
%    A slash separates A and B.
%
%    Note that if A is nonzero and B is 0, S will
%    be returned as "Inf" or "-Inf" (Infinity), and if both
%    A and B are zero, S will be returned as "NaN"
%    (Not-a-Number).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the numerator and denominator.
%
%    Output, character S(*), a left-justified string
%    containing the representation of A/B.
%

%
%  Take care of simple cases right away.
%
  if ( a == 0 )

    if ( b ~= 0 )
      s = '0';
    else
      s = 'NaN';
    end

  elseif ( b == 0 )

    if ( 0 < a )
      s = 'Inf';
    else
      s = '-Inf';
    end

  else

    s = sprintf ( '%d/%d', a, b );

  end

  return
end
