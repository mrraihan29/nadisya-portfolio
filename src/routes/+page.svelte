<script lang="ts">
	import Header from '$lib/components/Header.svelte';
	import Hero from '$lib/components/Hero.svelte';
	import FeaturedWork from '$lib/components/FeaturedWork.svelte';
	import Philosophy from '$lib/components/Philosophy.svelte';
	import Contact from '$lib/components/Contact.svelte';
</script>

<main class="portfolio">
	<Header />
	<Hero />
	<FeaturedWork />
	<Philosophy />
	<Contact />
</main>

<style>
	.portfolio {
		min-height: 100vh;
		background: var(--bg-color);
		color: var(--text-color);
	}
</style>
