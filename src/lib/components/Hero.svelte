<script lang="ts">
	import ThreeCanvas from './ThreeCanvas.svelte';
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';

	let heroRef: HTMLElement | null = null;
	let titleRef: HTMLElement | null = null;
	let subtitleRef: HTMLElement | null = null;
	let imageRef: HTMLElement | null = null;
	let scrollTextRef: HTMLElement | null = null;

	onMount(() => {
		// Sophisticated entrance animations
		const tl = gsap.timeline({ delay: 0.5 });

		// Title animation - letter by letter
		if (titleRef) {
			const titleLines = titleRef.querySelectorAll('.title-line');
			if (titleLines.length > 0) {
				gsap.set(titleLines, {
					y: 120,
					opacity: 0
				});

				tl.to(titleLines, {
					y: 0,
					opacity: 1,
					duration: 1.4,
					stagger: 0.1,
					ease: 'power3.out'
				});
			}
		}

		// Other animations with null checks
		if (subtitleRef) {
			tl.fromTo(
				subtitleRef,
				{ y: 40, opacity: 0 },
				{ y: 0, opacity: 1, duration: 1, ease: 'power2.out' },
				'-=0.8'
			);
		}

		if (imageRef) {
			tl.fromTo(
				imageRef,
				{ scale: 1.1, opacity: 0 },
				{ scale: 1, opacity: 1, duration: 1.5, ease: 'power2.out' },
				'-=1.2'
			);
		}

		if (scrollTextRef) {
			tl.fromTo(
				scrollTextRef,
				{ y: 20, opacity: 0 },
				{ y: 0, opacity: 1, duration: 0.8, ease: 'power2.out' },
				'-=0.3'
			);
		}

		// Parallax effect for hero image
		if (imageRef && heroRef) {
			gsap.to(imageRef, {
				yPercent: -15,
				ease: 'none',
				scrollTrigger: {
					trigger: heroRef,
					start: 'top top',
					end: 'bottom top',
					scrub: true
				}
			});
		}
	});

	const scrollToWork = () => {
		document.getElementById('work')?.scrollIntoView({ behavior: 'smooth' });
	};
</script>

<section bind:this={heroRef} class="hero" id="home">
	<div class="hero-container">
		<!-- Hero Content -->
		<div class="hero-content">
			<!-- Location and intro -->
			<div class="hero-intro">
				<span class="location-tag">JAKARTA, INDONESIA</span>
				<div class="intro-line"></div>
			</div>

			<!-- Main title -->
			<h1 bind:this={titleRef} class="hero-title">
				<span class="title-line title-main">NADISYA</span>
				<span class="title-line title-sub">PROFESSIONAL MODEL</span>
			</h1>

			<!-- Description -->
			<div bind:this={subtitleRef} class="hero-description">
				<p>
					A distinguished model who seamlessly blends contemporary elegance with authentic
					expression, creating captivating imagery that transcends traditional beauty standards.
				</p>
			</div>

			<!-- CTA and scroll indicator -->
			<div class="hero-actions">
				<button class="cta-button" on:click={scrollToWork}>
					<span>Explore Portfolio</span>
					<div class="button-bg"></div>
				</button>
			</div>
		</div>

		<!-- Hero Visual -->
		<div class="hero-visual">
			<div class="image-stack">
				<div bind:this={imageRef} class="main-image">
					<img src="/nadisya1.jpg" alt="Nadisya - Professional Model" />
					<div class="image-overlay"></div>
				</div>

				<!-- Floating Cards -->
				<div class="floating-elements">
					<div class="floating-card card-1">
						<span>EDITORIAL</span>
					</div>
					<div class="floating-card card-2">
						<span>FASHION</span>
					</div>
					<div class="floating-card card-3">
						<span>LIFESTYLE</span>
					</div>
				</div>
			</div>

			<!-- Decorative Shapes -->
			<div class="decorative-shapes">
				<div class="shape shape-1"></div>
				<div class="shape shape-2"></div>
				<div class="shape shape-3"></div>
			</div>
		</div>
	</div>

	<!-- Scroll Indicator - Positioned at bottom center -->
	<div bind:this={scrollTextRef} class="scroll-indicator">
		<span class="scroll-text">SCROLL TO DISCOVER</span>
		<div class="scroll-line"></div>
	</div>
	<!-- Background gradient overlay -->
	<div class="bg-gradient"></div>
</section>

<style>
	.hero {
		min-height: 100vh;
		background: var(--color-background);
		position: relative;
		overflow: hidden;
		display: flex;
		align-items: center;
	}

	.bg-gradient {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background:
			radial-gradient(ellipse at top left, rgba(240, 147, 251, 0.1) 0%, transparent 50%),
			radial-gradient(ellipse at bottom right, rgba(102, 126, 234, 0.1) 0%, transparent 50%);
		pointer-events: none;
	}

	.hero-container {
		max-width: var(--container-width);
		margin: 0 auto;
		padding: 8rem 2rem 2rem; /* Added top padding to account for fixed navbar */
		display: grid;
		grid-template-columns: 1.2fr 1fr;
		gap: 4rem;
		align-items: center;
		min-height: 100vh;
		position: relative;
		z-index: 2;
	}

	.hero-content {
		padding: 2rem 0;
	}

	.hero-intro {
		display: flex;
		align-items: center;
		gap: 1rem;
		margin-bottom: 3rem;
	}

	.location-tag {
		font-family: var(--font-sans);
		font-size: 0.75rem;
		font-weight: var(--font-weight-semibold);
		letter-spacing: 0.15em;
		color: var(--color-accent);
		text-transform: uppercase;
		background: rgba(240, 147, 251, 0.1);
		padding: 0.5rem 1rem;
		border-radius: 20px;
		border: 1px solid rgba(240, 147, 251, 0.2);
	}

	.intro-line {
		flex: 1;
		height: 1px;
		background: linear-gradient(90deg, var(--color-accent) 0%, transparent 100%);
	}

	.hero-title {
		font-family: var(--font-serif);
		margin-bottom: 2rem;
		line-height: 1;
	}

	.title-main {
		display: block;
		font-size: clamp(4rem, 8vw, 8rem);
		font-weight: 400;
		color: var(--color-text);
		letter-spacing: -0.02em;
		margin-bottom: 0.5rem;
	}

	.title-sub {
		display: block;
		font-size: clamp(1.2rem, 2.5vw, 2rem);
		font-weight: 300;
		color: var(--color-text-muted);
		letter-spacing: 0.05em;
		text-transform: uppercase;
		margin-left: 0.5rem;
	}

	.title-line {
		display: block;
		overflow: hidden;
	}

	.hero-description {
		margin-bottom: 3rem;
		max-width: 500px;
	}

	.hero-description p {
		font-family: var(--font-sans);
		font-size: 1.1rem;
		font-weight: var(--font-weight-light);
		line-height: 1.7;
		color: var(--color-text-muted);
	}

	.hero-actions {
		display: flex;
		align-items: center;
		gap: 3rem;
	}

	.cta-button {
		position: relative;
		background: transparent;
		border: 2px solid var(--color-accent);
		color: var(--color-text);
		font-family: var(--font-sans);
		font-size: 0.9rem;
		font-weight: var(--font-weight-medium);
		letter-spacing: 0.05em;
		text-transform: uppercase;
		padding: 1rem 2rem;
		border-radius: 50px;
		cursor: pointer;
		overflow: hidden;
		transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	}

	.button-bg {
		position: absolute;
		top: 0;
		left: -100%;
		width: 100%;
		height: 100%;
		background: linear-gradient(135deg, var(--color-accent) 0%, #8b5cf6 100%);
		transition: left 0.4s cubic-bezier(0.4, 0, 0.2, 1);
		z-index: -1;
	}

	.cta-button:hover .button-bg {
		left: 0;
	}

	.cta-button:hover {
		color: white;
		transform: translateY(-2px);
		box-shadow: 0 10px 30px rgba(240, 147, 251, 0.4);
	}

	.scroll-indicator {
		position: absolute;
		bottom: 3rem;
		left: 50%;
		transform: translateX(-50%);
		display: flex;
		align-items: center;
		gap: 1rem;
		z-index: 5;
	}

	.scroll-text {
		font-family: var(--font-sans);
		font-size: 0.7rem;
		font-weight: var(--font-weight-medium);
		letter-spacing: 0.2em;
		color: var(--color-text-light);
		text-transform: uppercase;
	}

	.scroll-line {
		width: 60px;
		height: 1px;
		background: linear-gradient(90deg, var(--color-text-light) 0%, transparent 100%);
	}

	.hero-visual {
		position: relative;
		height: 100vh;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.image-stack {
		position: relative;
		width: 100%;
		max-width: 500px;
	}

	.main-image {
		position: relative;
		width: 100%;
		height: 600px;
		border-radius: 20px;
		overflow: hidden;
		box-shadow: 0 30px 80px rgba(0, 0, 0, 0.15);
		transform: rotate(-2deg);
		transition: var(--transition);
	}

	.main-image:hover {
		transform: rotate(0deg) scale(1.02);
	}

	.main-image img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		object-position: center;
	}

	.image-overlay {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: linear-gradient(135deg, rgba(240, 147, 251, 0.1) 0%, rgba(139, 92, 246, 0.1) 100%);
		opacity: 0;
		transition: opacity 0.3s ease;
	}

	.main-image:hover .image-overlay {
		opacity: 1;
	}

	.floating-elements {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		pointer-events: none;
	}

	.floating-card {
		position: absolute;
		background: rgba(255, 255, 255, 0.95);
		backdrop-filter: blur(10px);
		border: 1px solid rgba(240, 147, 251, 0.3);
		border-radius: 15px;
		padding: 0.75rem 1.5rem;
		font-family: var(--font-sans);
		font-size: 0.8rem;
		font-weight: var(--font-weight-semibold);
		letter-spacing: 0.1em;
		text-transform: uppercase;
		color: var(--color-text);
		box-shadow: 0 10px 30px rgba(240, 147, 251, 0.2);
		animation: float 6s ease-in-out infinite;
	}

	.card-1 {
		top: 10%;
		right: -10%;
		animation-delay: 0s;
	}

	.card-2 {
		bottom: 20%;
		left: -15%;
		animation-delay: 2s;
	}

	.card-3 {
		top: 50%;
		right: -20%;
		animation-delay: 4s;
	}

	.decorative-shapes {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		pointer-events: none;
	}

	.shape {
		position: absolute;
		border-radius: 50%;
		background: linear-gradient(135deg, rgba(240, 147, 251, 0.6) 0%, rgba(139, 92, 246, 0.6) 100%);
		filter: blur(1px);
		animation: float 8s ease-in-out infinite;
	}

	.shape-1 {
		width: 20px;
		height: 20px;
		top: 20%;
		left: 10%;
		animation-delay: 1s;
	}

	.shape-2 {
		width: 15px;
		height: 15px;
		bottom: 30%;
		right: 20%;
		animation-delay: 3s;
	}

	.shape-3 {
		width: 25px;
		height: 25px;
		top: 60%;
		left: 5%;
		animation-delay: 5s;
	}

	@keyframes float {
		0%,
		100% {
			transform: translateY(0px) rotate(0deg);
		}
		33% {
			transform: translateY(-20px) rotate(2deg);
		}
		66% {
			transform: translateY(-10px) rotate(-2deg);
		}
	}

	/* Theme-specific styles */
	:global([data-theme='vibrant']) .hero {
		background: var(--color-background);
	}

	:global([data-theme='vibrant']) .location-tag {
		background: rgba(255, 255, 255, 0.15);
		color: rgba(255, 255, 255, 0.9);
		border-color: rgba(255, 255, 255, 0.3);
	}

	:global([data-theme='vibrant']) .title-main {
		color: rgba(255, 255, 255, 0.95);
		text-shadow: 0 2px 20px rgba(0, 0, 0, 0.3);
	}

	:global([data-theme='vibrant']) .title-sub {
		color: rgba(255, 255, 255, 0.85);
		text-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
	}

	:global([data-theme='vibrant']) .hero-description p {
		color: rgba(255, 255, 255, 0.9);
		text-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
	}

	:global([data-theme='vibrant']) .cta-button {
		border-color: rgba(255, 255, 255, 0.8);
		color: rgba(255, 255, 255, 0.9);
		background: rgba(255, 255, 255, 0.1);
		backdrop-filter: blur(10px);
	}

	:global([data-theme='vibrant']) .cta-button:hover {
		background: rgba(255, 255, 255, 0.2);
		color: rgba(45, 27, 105, 0.9);
		border-color: rgba(255, 255, 255, 1);
	}

	:global([data-theme='vibrant']) .scroll-text {
		color: rgba(255, 255, 255, 0.8);
		text-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
	}

	:global([data-theme='vibrant']) .scroll-line {
		background: linear-gradient(90deg, rgba(255, 255, 255, 0.8) 0%, transparent 100%);
	}

	:global([data-theme='vibrant']) .intro-line {
		background: linear-gradient(90deg, rgba(255, 255, 255, 0.6) 0%, transparent 100%);
	}

	/* Mobile responsive */
	@media (max-width: 1024px) {
		.hero-container {
			grid-template-columns: 1fr;
			gap: 3rem;
			padding: 6rem 1rem 2rem; /* Adjusted for mobile navbar */
		}

		.hero-visual {
			height: 60vh;
		}

		.main-image {
			height: 500px;
		}

		.floating-card {
			display: none;
		}

		.scroll-indicator {
			bottom: 2rem;
		}
	}

	@media (max-width: 768px) {
		.hero-container {
			padding: 5rem 1rem 2rem; /* Reduced padding for smaller screens */
		}

		.hero-actions {
			flex-direction: column;
			align-items: flex-start;
			gap: 2rem;
		}

		.main-image {
			height: 400px;
			transform: none;
		}

		.title-main {
			font-size: 3rem;
		}

		.title-sub {
			font-size: 1rem;
		}

		.hero-description p {
			font-size: 1rem;
		}

		.scroll-indicator {
			bottom: 1rem;
		}
	}
</style>
