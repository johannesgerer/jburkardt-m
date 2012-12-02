function s = frac_to_s ( f )

%*****************************************************************************80
%
%% FRAC_TO_S writes a positive fraction into a left justified character string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real F, the number to be written into the string.
%    F should be between 0.0 and 1.0.
%
%    Output, string S, a representation of F.
%
  if ( f < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1,  'FRAC_TO_S - Fatal error!\n' );
    fprintf ( 1,  '  The input fraction was negative:\n' );
    fprintf ( 1,  '  F = %f\n', f );
    error ( 'FRAC_TO_S - Fatal error.' );
  end

  if ( 1.0 <= f )
    fprintf ( 1,  '\n' );
    fprintf ( 1,  'FRAC_TO_S - Fatal error!\n' );
    fprintf ( 1,  '  The input fraction was 1 or more:\n' );
    fprintf ( 1,  '  F = %f\n', f );
    error ( 'FRAC_TO_S - Fatal error.' );
  end

  s = sprintf ( '%11.10', f );

  return
end
