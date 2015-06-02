function moment = truncated_normal_a_moment ( order, mu, s, a )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_MOMENT returns a moment of the lower truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the moment.
%    0 <= ORDER.
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, the lower truncation limit.
%
%    Output, real MOMENT, the moment of the PDF.
%
  moment = r8_mop ( order ) ...
    * truncated_normal_b_moment ( order, -mu, s, -a );

  return
end
