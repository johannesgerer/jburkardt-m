function ierror = rgf_check ( m, f )

%*****************************************************************************80
%
%% RGF_CHECK checks a restricted growth function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer M, the domain of the RGF is the integers
%    from 1 to M.  M must be positive.
%
%    Input, integer F(M), the restricted growth function.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    -1, M is illegal.
%    I, entry I of the restricted growth function is illegal.
%
  ierror = 0;

  if ( m <= 0 )
    ierror = -1;
    return
  end

  fmax = 0;
  for i = 1 : m
    if ( f(i) <= 0 || fmax + 1 < f(i) )
      ierror = i;
      return
    end
    fmax = max ( fmax, f(i) );
  end

  return
end
