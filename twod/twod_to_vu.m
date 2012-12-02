function [] = twod_tovu(fname,x,e_conn,u,var)
%-----------------------------------------------------------------------
%  twod_tovu.m - Writes out a 2D finite element solution to a format 
%                readable by Vu 
%                (http://www.cerca.umontreal.ca/vu/welcome.html)
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0
%
%  Usage:    [] = twod_tovu(fname,x,e_conn,u,var)
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
    fprintf(fid,' %10.6e  %10.6e\n',x(i,1),x(i,2));
  end
  fprintf(fid,'};\n\n');

  % Write out element connectivity
  fprintf(fid,'FIELD<int> e_conn( ) =\n{\n');
  if ( nel_dof==3 ) % Test for linear triangles
    for i=1:n_elements
      fprintf(fid,' %6i  %6i  %6i\n',e_conn(i,:));
    end
  elseif ( nel_dof==6 ) % Test for quadratic triangles
    for i=1:n_elements
      fprintf(fid,' %6i  %6i  %6i  %6i  %6i  %6i\n',e_conn(i,:));
    end
  else
    fprintf('twod_tovu: element type not currently implemented\n')
    break
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
  if ( nel_dof==3 )
    fprintf(fid,'MESH MyMesh( ) =\n{\n');
    fprintf(fid,'   ZONE Zone1( LagrTrian03, x_coord, e_conn );\n' );
    fprintf(fid,'};\n\n');
  elseif ( nel_dof==6 )
    fprintf(fid,'MESH MyMesh( ) =\n{\n');
    fprintf(fid,'   ZONE Zone1( LagrTrian06, x_coord, e_conn );\n' );
    fprintf(fid,'};\n\n');
  end

  fprintf(fid,'SOLUTION MySolution( ) =\n{\n');
  if ( nel_dof==3 )
    for n_var=1:n_variables
      temp = strcat('   VARIABLE@'   , var(n_var).name,...
                    '( LagrTrian03,@', var(n_var).name,...
                    ', e_conn, Zone1 );\n');
      temp = strrep(temp,'@',' ');
      fprintf(fid,temp);
    end
  else
    for n_var=1:n_variables
      temp = strcat('   VARIABLE@'   , var(n_var).name,...
                    '( LagrTrian06,@', var(n_var).name,...
                    ', e_conn, Zone1 );\n');
      temp = strrep(temp,'@',' ');
      fprintf(fid,temp);
    end
  end
  fprintf(fid,'};\n');

  fclose(fid);
