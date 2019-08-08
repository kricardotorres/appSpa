<template>
	<div>
		<h1>Contacts ()</h1>


		<table class="table table-bordered table-hover">

			<thead>

				<tr>

					<th>#</th>

					<th>First Name</th>
					<th>Last Name</th> 
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="investigated in investigateds">

					<th v-text="investigated.id"> </th>

					<th v-text="investigated.name"> </th>

					<td v-text="investigated.lastname1"> </td> 

					<td>

						<button class="btn btn-danger" @click="deleteContact(id)"> X</button>
					</td>
				</tr>
			</tbody>
		</table>
		<div>
		</div>
	</div>

</template>
<script> 

	export default {

		name: 'ListContacts',

		components: {

		},

		data() {

			return {
				investigateds: [],
				numberOfinvestigateds:0,

			};

		},

		methods: { 
			getInvestigateds(){

			      this.$store
			        .dispatch("getInvestigateds" )
			        .then((data) => { 
			        	console.log(data);
					this.investigateds = data.investigateds
					this.numberOfinvestigateds= data.total_count;
				});
				 
			},
		},

		mounted() {
			this.getInvestigateds();
		},
	}

</script>
