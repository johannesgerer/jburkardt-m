function month_name = month_to_month_name_eg_civil ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_EG_CIVIL returns the name of an Egyptian Civil month.
%
%  Discussion:
%
%    The 13th month had only 5 days, which were treated as the birthdays
%    of Osiris, Horus, Set, Isis and Nephthys.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the month.
%
%    Output, character MONTH_NAME, the month name.
%
  name = [ ...
    'Thoth     '; 'Phaophi   '; 'Hathyr    '; 'Choiak    '; ...
    'Tybi      '; 'Mecheir   '; 'Phamenoth '; 'Pharmouthi'; ...
    'Pachon    '; 'Payni     '; 'Epeiph    '; 'Mesore    '; ...
    'Epagomenai' ];

  if ( m < 1 || 13 < m )
    month_name = '?????????';
  else
    month_name = name(m,:);
  end

  return
end
