function check = dirichlet_mix_check ( comp_num, elem_num, a, comp_weight )

%*****************************************************************************80
%
%% DIRICHLET_MIX_CHECK checks the parameters of a Dirichlet mixture PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer COMP_NUM, the number of components in the Dirichlet
%    mixture density, that is, the number of distinct Dirichlet PDF's
%    that are mixed together.
%
%    Input, integer ELEM_NUM, the number of elements of an observation.
%
%    Input, real A(ELEM_NUM,COMP_NUM), the probabilities
%    for element ELEM_NUM in component COMP_NUM.
%    Each A(I,J) should be positive.
%
%    Input, real COMP_WEIGHT(COMP_NUM), the mixture weights of the densities.
%    These do not need to be normalized.  The weight of a given component is
%    the relative probability that that component will be used to generate
%    the sample.
%
  for comp_i = 1 : comp_num

    for elem_i = 1 : elem_num
      if ( a(elem_i,comp_i) <= 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'DIRICHLET_MIX_CHECK - Fatal error!\n' );
        fprintf ( 1, '  A(ELEM,COMP) <= 0.\n' );
        fprintf ( 1, '  COMP = %d\n', comp_i );
        fprintf ( 1, '  ELEM = %d\n', elem_i );
        fprintf ( 1, '  A(COMP,ELEM) = %f\n', a(elem_i,comp_i) );
        check = 0;
        return
      end
    end

  end

  positive = 0;

  for comp_i = 1 : comp_num

    if ( comp_weight(comp_i) < 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'DIRICHLET_MIX_CHECK - Fatal error!\n' );
      fprintf ( 1, '  COMP_WEIGHT(COMP) < 0.\n' );
      fprintf ( 1, '  COMP = %d\n', comp_i );
      fprintf ( 1, '  COMP_WEIGHT(COMP) = %d\n', comp_weight(comp_i) );
      check = 0;
      return
    elseif ( 0.0 < comp_weight(comp_i) )
      positive = 1;
    end

  end

  if ( ~positive )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRICHLET_MIX_CHECK - Fatal error!\n' );
    fprintf ( 1, '  All component weights are zero.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
