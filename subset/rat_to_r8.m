function r = rat_to_r8 ( a, b )

%*****************************************************************************80
%
%% RAT_TO_R8 converts rational values to real values.
%
%  Example:
%
%    A    B    R
%   --   --    ---
%    1    2    0.5
%    7    5    1.4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the rational quantity to be converted.
%
%    Output, real R, the value of the rational quantity as a real number.
%
  if ( b == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_TO_R8 - Warning!\n' );
    fprintf ( 1, '  The input fraction to be converted had a\n' );
    fprintf ( 1, '  zero denominator.\n' );
    r = 0.0;
    error ( 'RAT_TO_R8 - Fatal error!' );
  end

  r = a / b;

  return
end
