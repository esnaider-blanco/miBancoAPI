using MiBancoAPI.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MiBancoAPI.Services.ServicioCuentaBancaria
{
    public class CuentaBancariaRepositorio : ICuentaBancariaRepositorio
    {
        public readonly db_miViajeCR_miBancoContext _dbContext;

        public CuentaBancariaRepositorio(db_miViajeCR_miBancoContext context)
        {
            _dbContext = context;
        }

        public async Task<string> InsertaCuentaBancaria(int idUsuario, decimal saldoInicial, bool esCuentaPrincipal)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spInsertaCuentaBancaria] 
                                @IdUsuario,                              
                                @SaldoInicial,
                                @EsCuentaPrincipal,
                                @DbRespuesta OUTPUT";

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@IdUsuario", Value=idUsuario},
                    new SqlParameter { ParameterName = "@SaldoInicial", Value=saldoInicial},
                    new SqlParameter { ParameterName = "@EsCuentaPrincipal", Value=esCuentaPrincipal},
                    new SqlParameter { ParameterName = "@DbRespuesta", SqlDbType = System.Data.SqlDbType.VarChar, Size = 100, Direction = System.Data.ParameterDirection.Output}
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (parms[3].Value != DBNull.Value)
                {
                    response = parms[3].Value.ToString();
                }

            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }

        public async Task<string> RealizaDeposito(int idCuentaBancaria, decimal monto)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spActualizaSaldo] 
                                @IdCuentaBancaria,                              
                                @Monto";

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@IdCuentaBancaria", Value=idCuentaBancaria},
                    new SqlParameter { ParameterName = "@Monto", Value=monto},
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (affectedRows > 0)
                {
                    response = "El deposito se ha completado exitosamente.";
                }
            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }
       
        public async Task<string> RealizaPagoReserva(int idCuentaBancaria, decimal monto, int idUsuarioDestino)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spRealizaPagoReserva] 
                                @IdCuentaBancariaOrigen,                              
                                @Monto,
                                @IdUsuarioDestino";

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@IdCuentaBancariaOrigen", Value=idCuentaBancaria},
                    new SqlParameter { ParameterName = "@Monto", Value=monto},
                    new SqlParameter { ParameterName = "@IdUsuarioDestino", Value=idUsuarioDestino},
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (affectedRows > 0)
                {
                    response = "El pago de la reserva se ha completado exitosamente.";
                }
            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }

        public async Task<List<CuentaBancariaCustom>> ObtieneCuentasBancariasPorIdUsuario(int idUsuario)
        {
            return await _dbContext.CuentaBancariaCustom
                .FromSqlRaw<CuentaBancariaCustom>("spObtieneCuentasPorIdUsuario {0}", idUsuario)
                .ToListAsync();
        }

        public async Task<List<TransaccionCustom>> ObtieneTransaccionesPorIdCuenta(int idCuentaBancaria)
        {
            return await _dbContext.TransaccionCustom
            .FromSqlRaw<TransaccionCustom>("spObtieneTransaccionesPorIdCuentaBancaria {0}", idCuentaBancaria)
            .ToListAsync();
        }

        public async Task<string> ActualizaCuentaPrincipal(int idCuentaBancaria, int idUsuario, bool esCuentaPrincipal)
        {
            string response = string.Empty;
            try
            {
                string sql = @"exec [spActualizaCuentaPrincipal]                                 
                                @IdCuentaBancaria,                              
                                @IdUsuario,
                                @EsCuentaPrincipal";

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@IdNotificacion", Value=idCuentaBancaria},
                    new SqlParameter { ParameterName = "@FueLeida", Value=idUsuario},
                    new SqlParameter { ParameterName = "@FueLeida", Value=esCuentaPrincipal}
                };

                var affectedRows = _dbContext.Database.ExecuteSqlRaw(sql, parms.ToArray());
                if (affectedRows > 0)
                {
                    response = "La cuenta bancaria principal se actualizo exitosamente.";
                }
            }
            catch (Exception e)
            {
                response = e.Message;
            }
            return response;
        }
    }
}
