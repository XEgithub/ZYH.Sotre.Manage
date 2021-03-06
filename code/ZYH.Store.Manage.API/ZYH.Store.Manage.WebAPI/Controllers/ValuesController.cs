﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace ZYH.Store.Manage.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            string heads = string.Join(',', HttpContext.Request.Headers.Keys.Select(p => p.ToString()).ToList());
            string headvalues=string.Join(',',HttpContext.Request.Headers.Values.Select(p=>p.ToString()).ToList());
            return $"value:{id},head:[{heads}],value:[{headvalues}]";
        }

        // POST api/values
        [HttpPost]
        public ActionResult<string> Post([FromBody] string value)
        {
            return "Post Is Ok";
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public ActionResult<string> Put(int id, [FromBody] string value)
        {
            return "Put Is Ok";
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public ActionResult<string> Delete(int id)
        {
            return "Delete Is Ok";
        }
    }
}
