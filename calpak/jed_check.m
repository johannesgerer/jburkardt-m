function ierror = jed_check ( jed )

%*****************************************************************************80
%
%% JED_CHECK checks a Julian Ephemeris Date.
%
%  Discussion:
%
%    The routine returns an error if JED < 0, although there is no
%    reason why such dates are invalid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer IERROR, is 0 if JED is legal, and 1 otherwise.
%
  if ( 0.0 <= jed )
    ierror = 0;
  else
    ierror = 1;
  end

  return
end
