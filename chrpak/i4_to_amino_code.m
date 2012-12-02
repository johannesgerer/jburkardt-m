function c = i4_to_amino_code ( i )

%*****************************************************************************80
%
%% I4_TO_AMINO_CODE converts an integer to an amino code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl Branden, John Tooze,
%    Introduction to Protein Structure,
%    Garland Publishing, 1991.
%
%  Parameters:
%
%    Input, integer I, the index of an amino acid, between 1 and 23.
%
%    Output, character C, the one letter code for an amino acid.
%
  n = 23;

  ch_table = [ ...
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', ...
    'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', ...
    'X', 'Y', 'Z' ];

  if ( 1 <= i && i <= n )
    c = ch_table(i);
  else
    c = '?';
  end

  return
end
