class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
				id(matches:/\d+/)
			}
		}

		"/schedules/show/$id/$company" {
			controller = 'schedule'
			action = 'show'
			constraints {
				id(matches:/\d+/)
				company(matches:/\d+/)
			}
		}

		"/schedules/delete/$id/$company" {
			controller = 'schedule'
			action = 'delete'
			constraints {
				id(matches:/\d+/)
				company(matches:/\d+/)	
			}
		}

		"/product/show/$id/$company" {
			controller = 'product'
			action = 'show'
			constraints {
				id(matches:/\d+/)
				company(matches:/\d+/)
			}
		}

		"/product/delete/$id/$company" {
			controller = 'product'
			action = 'delete'
			constraints {
				id(matches:/\d+/)
				company(matches:/\d+/)	
			}
		}

		"/branches/show/$id/$company" {
			controller = 'branch'
			action = 'show'
			constraints {
				id(matches:/\d+/)
				company(matches:/\d+/)
			}
		}

		"/branches/delete/$id/$company" {
			controller = 'branch'
			action = 'delete'
			constraints {
				id(matches:/\d+/)
				company(matches:/\d+/)	
			}
		}

		"/"(controller:'deal',action:'all')
		"500"(view:'/error')
		"404"(view:'/404')
		"/faq"(view:'/faq')
		"/promise"(view:'/promise')
		"/howitswork"(view:'/howitswork')
	}
}
