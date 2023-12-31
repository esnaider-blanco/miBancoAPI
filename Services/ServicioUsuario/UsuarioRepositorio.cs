﻿using MiBancoAPI.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MiBancoAPI.Services.ServicioUsuario
{
    public class UsuarioRepositorio : IUsuarioRepositorio
    {
        public readonly db_miViajeCR_miBancoContext _dbContext;

        public UsuarioRepositorio(db_miViajeCR_miBancoContext context)
        {
            _dbContext = context;
        }

        public async Task<string> InsertaUsuario(string nombre, string apellidos, DateTime fechaNacimiento, string correoElectronico, string contraseña)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spInsertaUsuario] 
                                @Nombre,                              
                                @Apellidos,
                                @FechaNacimiento,
                                @CorreoElectronico,                              
                                @Contraseña,
                                @DbRespuesta OUTPUT";

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@Nombre", Value=nombre},
                    new SqlParameter { ParameterName = "@Apellidos", Value=apellidos},
                    new SqlParameter { ParameterName = "@FechaNacimiento", Value=fechaNacimiento},
                    new SqlParameter { ParameterName = "@CorreoElectronico", Value=correoElectronico},
                    new SqlParameter { ParameterName = "@Contraseña", Value=contraseña},
                    new SqlParameter { ParameterName = "@DbRespuesta", SqlDbType = System.Data.SqlDbType.VarChar, Size = 100, Direction = System.Data.ParameterDirection.Output}
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (parms[5].Value != DBNull.Value)
                {
                    response = parms[5].Value.ToString();
                }

            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }

        public async Task<string> LoginUsuario(string correoElectronico, string contraseña)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spLogin] 
                                @CorreoElectronico,                              
                                @Contraseña,
                                @DbRespuesta OUTPUT";

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@CorreoElectronico", Value=correoElectronico},
                    new SqlParameter { ParameterName = "@Contraseña", Value=contraseña},
                    new SqlParameter { ParameterName = "@DbRespuesta", SqlDbType = System.Data.SqlDbType.VarChar, Size = 100, Direction = System.Data.ParameterDirection.Output}
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (parms[2].Value != DBNull.Value)
                {
                    response = parms[2].Value.ToString();
                }

            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }

        public async Task<string> LogoutUsuario(int idUsuario)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spLogout] 
                                @IdUsuario,
                                @DbRespuesta OUTPUT";

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@IdUsuario", Value=idUsuario},
                    new SqlParameter { ParameterName = "@DbRespuesta", SqlDbType = System.Data.SqlDbType.VarChar, Size = 100, Direction = System.Data.ParameterDirection.Output}
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (parms[1].Value != DBNull.Value)
                {
                    response = parms[1].Value.ToString();
                }

            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }

        public async Task<string> ObtieneIdUsuarioPorCorreoElectronico(string correoElectronico)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spObtieneIdUsuarioPorCorreoElectronico] 
                                @CorreoElectronico,
                                @DbRespuesta OUTPUT";
                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@CorreoElectronico", Value=correoElectronico},
                    new SqlParameter { ParameterName = "@DbRespuesta", SqlDbType = System.Data.SqlDbType.VarChar, Size = 100, Direction = System.Data.ParameterDirection.Output}
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (parms[1].Value != DBNull.Value)
                {
                    response = parms[1].Value.ToString();
                }
            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }

        public async Task<string> ObtieneTokenPorIdUsuario(int idUsuario)
        {
            try
            {
                string sql = @"exec [spObtieneToken] 
                                @IdUsuario,
                                @DbRespuesta OUTPUT";
                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@IdUsuario", Value=idUsuario},
                    new SqlParameter { ParameterName = "@DbRespuesta", SqlDbType = System.Data.SqlDbType.VarChar, Size = 100, Direction = System.Data.ParameterDirection.Output}
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (parms[1].Value != DBNull.Value)
                {
                    var jsonResult = new
                    {
                        token = parms[1].Value
                    };
                    return JsonConvert.SerializeObject(jsonResult);
                }
                else
                {
                    var jsonResult = new
                    {
                        token = ""
                    };
                    return JsonConvert.SerializeObject(jsonResult);
                }
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
    }
}
