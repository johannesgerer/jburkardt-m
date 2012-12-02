function [] = threed_to_vu(fname,x,e_conn,u,var)
%-----------------------------------------------------------------------
%  threed_to_vu.m - Writes out a 3D finite element solution to a format 
%                readable by Vu 
%                (http://www.cerca.umontreal.ca/vu/welcome.html)
%
%  Copyright (c) 2002, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [] = threed_to_vu(fname,x,e_conn,u,var)
%
%  Variables:     fname
%                        Name of the output file (default="femvu.vu")
%                 x
%                        Nodal coordinates
%                 e_conn
%                        Element connectivity
%                 u
%                        Columns of scalar variables to write to Vu file
%                 var(n_var).names
%                        List of scalar variable names (default="var#")
%-----------------------------------------------------------------------
  [n_nodes,    n_dim      ] = size(x);
  [n_elements, nel_dof    ] = size(e_conn);
  [temp      , n_variables] = size(u);
  var(n_variables+1).name = '';

  if ( isempty(fname) )
    fname = 'femvu.vu';
  end
  fid = fopen(fname,'w');

  % Write out coordinate values
  fprintf(fid,'FIELD x_coord( ) =\n {\n');
  for i=1:n_nodes
    fprintf(fid,' %10.6e %10.6e %10.6e\n',x(i,1),x(i,2),x(i,3));
  end
  fprintf(fid,'};\n\n');

  % Write out element connectivity
  fprintf(fid,'FIELD<int> e_conn( ) =\n{\n');
  if ( nel_dof==4 ) % Test for linear tetrahedra
    for i=1:n_elements
      fprintf(fid,' %6i %6i %6i %6i\n',e_conn(i,:));
    end
  elseif ( nel_dof==10 ) % Test for quadratic tetrahedra
    for i=1:n_elements
      fprintf(fid,' %6i %6i %6i %6i %6i %6i %6i %6i %6i %6i\n',...
              e_conn(i,[1 2 3 4 5 6 7 10 8 9]));
    end
  else
    error('threed_tovu: element type not currently implemented\n')
    return
  end
  fprintf(fid,'};\n\n');

  % Write out variables
  for n_var=1:n_variables
    if ( isempty(var(n_var).name) )
      var(n_var).name = strcat('Var',int2str(n_var));
    end

    temp = strcat('FIELD@',var(n_var).name,'( ) = {\n');
    temp = strrep(temp,'D@','D ');
    fprintf(fid,temp);
    fprintf(fid,' %10.5e %10.5e %10.5e %10.5e %10.5e %10.5e \n',...
                  u(:,n_var) );
    fprintf(fid,'\n};\n');
  end
  fprintf(fid,'\n\n');

  % Write out zones and connectivity
  if ( nel_dof==4 )
    fprintf(fid,'MESH MyMesh( ) =\n{\n');
    fprintf(fid,'   ZONE Zone1( LagrTetra04, x_coord, e_conn );\n' );
    fprintf(fid,'};\n\n');
  elseif ( nel_dof==10 )
    fprintf(fid,'MESH MyMesh( ) =\n{\n');
    fprintf(fid,'   ZONE Zone1( LagrTetra10, x_coord, e_conn );\n' );
    fprintf(fid,'};\n\n');
  end

  fprintf(fid,'SOLUTION MySolution( ) =\n{\n');
  if ( nel_dof==4 )
    for n_var=1:n_variables
      temp = strcat('   VARIABLE@'   , var(n_var).name,...
                    '( LagrTetra04,@', var(n_var).name,...
                    ', e_conn, Zone1 );\n');
      temp = strrep(temp,'@',' ');
      fprintf(fid,temp);
    end
  else
    for n_var=1:n_variables
      temp = strcat('   VARIABLE@'   , var(n_var).name,...
                    '( LagrTetra10,@', var(n_var).name,...
                    ', e_conn, Zone1 );\n');
      temp = strrep(temp,'@',' ');
      fprintf(fid,temp);
    end
  end
  fprintf(fid,'};\n');

  fclose(fid);
